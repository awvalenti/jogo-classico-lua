function criar_objeto(x, y, largura, altura)
  return {x = x, y= y, largura = largura, altura = altura}
end

function love.load()
  largura = 20
  altura = 50

  navinha = criar_objeto((love.graphics.getWidth() - largura) / 2,
  love.graphics.getHeight() - altura, largura, altura)

  function navinha:incrementar_x(inc) navinha.x = navinha.x + inc end

  inimigo = criar_objeto(20, 30, 30, 30)

  inimigo.incremento_x = 3

  inimigo.incrementar_x = function(inc) inimigo.x = inimigo.x + inc end

  inimigo.moverse = function()
    if inimigo.x + inimigo.largura >= love.graphics.getWidth() then
      inimigo.incremento_x = -3
    elseif inimigo.x <= 0 then
      inimigo.incremento_x = 3
    end

    inimigo.x = inimigo.x + inimigo.incremento_x

    inimigo.y = inimigo.y + velocidade_mundo
  end
  velocidade_mundo = 1
end


function love.update(dt)
  if love.keyboard.isDown('left') then
    navinha:incrementar_x(-3)
  elseif love.keyboard.isDown('right') then
    navinha:incrementar_x(3)
  end

  inimigo.moverse()
end

function love.draw()
  -- love.graphics.setBackgroundColor(0, 100, 0)


  -- love.graphics.setColor(0, 0, 255)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle('fill', navinha.x, navinha.y,
      navinha.largura, navinha.altura)

texto = ""
if navinha_colisao(inimigo) then texto = "colidiu"end

      love.graphics.print(texto, 100, 100)

  love.graphics.setColor(127, 50, 50)
  love.graphics.rectangle('fill', inimigo.x, inimigo.y,
      inimigo.largura, inimigo.altura)
end

function navinha_colisao(inimigo)
  return navinha.x <= inimigo.x + inimigo.largura and navinha.x + navinha.largura >= inimigo.x
  and navinha.y <= inimigo.y + inimigo.altura and  navinha.y + navinha.altura >= inimigo.y
end
