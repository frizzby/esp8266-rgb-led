r_pin=1 
g_pin=2
b_pin=3
current_hue = 0
current_sat = 1
current_lum = 0.5


-- convert color from HSL model to RGB
function hslToRgb(h, s, l)
  local r, g, b

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    function hue2rgb(p, q, t)
      if t < 0   then t = t + 1 end
      if t > 1   then t = t - 1 end
      if t < 1/6 then return p + (q - p) * 6 * t end
      if t < 1/2 then return q end
      if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
      return p
    end

    local q
    if l < 0.5 then q = l * (1 + s) else q = l + s - l * s end
    local p = 2 * l - q

    r = hue2rgb(p, q, h + 1/3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1/3)
  end

  return math.floor(r * 1023 + 0.5), math.floor(g * 1023 + 0.5), math.floor(b * 1023 + 0.5)
end


function admin(s, c)
    -- http://www.limitlessled.com/dev/
    local cmd, arg, act, r, g, b
    cmd = c:byte(1)
    act = false
    -- set color
    if cmd==32 then
        act = true
        arg = c:byte(2)
        -- (256 -x + 181)/256*360
        current_hue = (((256-arg+181)/256*360) % 360)/360
        current_lum = 0.5
    -- increase lightness
    elseif cmd==35 then
        act = true
        current_lum = current_lum + 0.05
        if current_lum > 1 then current_lum = 1 end
    -- decrease lightness
    elseif cmd==36 then
        act = true
        current_lum = current_lum - 0.05
        if current_lum < 0 then current_lum = 0 end
    -- increase saturation
    elseif cmd==39 then
        act = true
        current_sat = current_sat + 0.05
        if current_sat > 1 then current_sat = 1 end
    -- decrease saturation
    elseif cmd==40 then
        act = true
        current_sat = current_sat - 0.05
        if current_sat < 0 then current_sat = 0 end
    -- turn lights off
    elseif cmd==34 then
        pwm.stop(r_pin)
        pwm.stop(g_pin)
        pwm.stop(b_pin)
    -- turn lights on
    elseif cmd==33 then
        pwm.start(r_pin)
        pwm.start(g_pin)
        pwm.start(b_pin)
    end

    if act then
        r, g, b = hslToRgb(current_hue, current_sat, current_lum)
                
        pwm.setduty(r_pin, r)
        pwm.setduty(g_pin, g)
        pwm.setduty(b_pin, b)
    end
   
end

s=net.createServer(net.UDP)
s:on("receive", admin)
s:listen(8899)
print("Server ready")

pwm.setup(r_pin, 1000, 5)
pwm.setup(g_pin, 1000, 5)
pwm.setup(b_pin, 1000, 5)