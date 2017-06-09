function new_Inimigo(x, y, largura, altura, velocidade_escalar_x)
  local inimigo = new_Elemento(x, y, largura, altura)
  local velocidade_x = velocidade_escalar_x

  inimigo.moverse = function()
    -- TODO Unificar com Elemento.moverse
    
    if inimigo.x + inimigo.largura >= love.graphics.getWidth() or inimigo.x <= 0 then
      velocidade_x = -velocidade_x
    end

    inimigo.x = inimigo.x + velocidade_x

    inimigo.y = inimigo.y + velocidade_mundo
  end

  return inimigo
end
