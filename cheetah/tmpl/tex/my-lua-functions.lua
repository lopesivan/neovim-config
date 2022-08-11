function two (n)
  local ret = 0
  ret = n*2
  return ret
end

function fact (n)
  if n == 0 then
    return 1
  else
    return n * fact(n-1)
  end
end

function epura (abscissa, afastamento, cota, ponto)
  if cota > 0 then
    if afastamento >  0 then
      y = - afastamento
      cmd = "\\tkzDefPoint("..abscissa..","..y.."){"..ponto.."}"
      tex.print(cmd)
      cmd = "\\tkzDefPoint("..abscissa..","..cota.."){"..ponto.."'}"
      tex.print(cmd)
      cmd = "\\tkzDrawPoints("..ponto..","..ponto.."')"
      tex.print(cmd)
      cmd = "\\tkzLabelPoints("..ponto..","..ponto.."')"
      tex.print(cmd)
      cmd = "\\tkzDrawSegments[color=gray, style=dashed]("..ponto..","..ponto.."')"
      tex.print(cmd)
    else
      y = - afastamento
      return "diedro 2".."\n"..
"\\tkzDefPoint("..abscissa..","..y.."){"..ponto.."}".."\n"..
"\\tkzDefPoint("..abscissa..","..cota.."){"..ponto.."'}".."\n"..
"\\tkzDrawPoints("..ponto..","..ponto.."')".."\n"..
"\\tkzLabelPoints("..ponto..","..ponto.."')".."\n"..
"\\tkzDrawSegments[color=gray, style=dashed]("..ponto..","..ponto.."')".."\n"
    end
  else

    if afastamento >  0 then
      y = - afastamento
      return "diedro 4".."\n"..
"\\tkzDefPoint("..abscissa..","..y.."){"..ponto.."}".."\n"..
"\\tkzDefPoint("..abscissa..","..cota.."){"..ponto.."'}".."\n"..
"\\tkzDrawPoints("..ponto..","..ponto.."')".."\n"..
"\\tkzLabelPoints("..ponto..","..ponto.."')".."\n"..
"\\tkzDrawSegments[color=gray, style=dashed]("..ponto..","..ponto.."')".."\n"
    else
      y = - cota
      return "diedro 3".."\n"..
"\\tkzDefPoint("..abscissa..","..y.."){"..ponto.."}".."\n"..
"\\tkzDefPoint("..abscissa..","..cota.."){"..ponto.."'}".."\n"..
"\\tkzDrawPoints("..ponto..","..ponto.."')".."\n"..
"\\tkzLabelPoints("..ponto..","..ponto.."')".."\n"..
"\\tkzDrawSegments[color=gray, style=dashed]("..ponto..","..ponto.."')".."\n"
    end
  end
end

-- print(epura(2.33,  1.3,  1.0,"A"))
-- print(epura(2.33, -1.3,  1.0,"B"))
-- print(epura(2.33, -1.3, -1.0,"C"))
-- print(epura(2.33,  1.3, -1.0,"D"))
