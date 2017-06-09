require "elemento"
require "navinha"
require "inimigo"
require "tiro"

function love.load()
  navinha = new_Navinha()
  tiro = new_Tiro()

  inimigos = {
    new_Inimigo(20, 30, 30, 30, 3),
    new_Inimigo(320, 120, 30, 30, -6),
    new_Inimigo(20, 30, 30, 30, 1),
    new_Inimigo(20, 30, 30, 30, 8),
    new_Inimigo(20, 30, 30, 30, 4),
    new_Inimigo(20, 30, 30, 30, 45),
    new_Inimigo(20, 30, 30, 30, -8)
  }

  velocidade_mundo = 2
end

function love.update(dt)
  tratar_teclado()

  for _, inimigo in ipairs(inimigos) do
    inimigo.moverse()
  end

  if navinha.atirando then
    tiro.moverse()
  end

end

function tratar_teclado()
  if love.keyboard.isDown('left') then
    navinha.somar_x(-3)
  elseif love.keyboard.isDown('right') then
    navinha.somar_x(3)
  end
  if navinha.atirando then
    if tiro.y < 0 then navinha.encerrar_tiro() end
  elseif love.keyboard.isDown(' ') then
    navinha.iniciar_tiro(tiro)
  end
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle('fill', navinha.x, navinha.y,
      navinha.largura, navinha.altura)

  love.graphics.setColor(127, 50, 50)

  if navinha.atirando then
    love.graphics.rectangle('fill', tiro.x, tiro.y, tiro.largura,
        tiro.altura)
  end

  for _, inimigo in ipairs(inimigos) do
    love.graphics.rectangle('fill', inimigo.x, inimigo.y,
        inimigo.largura, inimigo.altura)
  end
end
