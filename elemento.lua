function new_Elemento(x, y, largura, altura, velocidade_x, velocidade_y)
  local elemento = {
    x = x,
    y = y,
    largura = largura,
    altura = altura,
    velocidade_x = velocidade_x,
    velocidade_y = velocidade_y
  }

  elemento.somar_x = function(valor)
    elemento.x = elemento.x + valor
  end

  elemento.colide_com = function(outro)
    return
        elemento.x <= outro.x + outro.largura and
        elemento.x + elemento.largura >= outro.x and
        elemento.y <= outro.y + outro.altura and
        elemento.y + elemento.altura >= outro.y
  end

  elemento.moverse = function()
    elemento.x = elemento.x + elemento.velocidade_x
    elemento.y = elemento.y + elemento.velocidade_y
  end

  return elemento
end
