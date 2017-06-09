function new_Navinha()
  local largura = 20
  local altura = 50
  local navinha = new_Elemento((love.graphics.getWidth() - largura) / 2,
      love.graphics.getHeight() - altura, largura, altura)

  navinha.atirando = false

  navinha.iniciar_tiro = function(tiro)
    navinha.atirando = true
    tiro.x = navinha.x + (navinha.largura - tiro.largura) / 2
    tiro.y = navinha.y
  end

  navinha.encerrar_tiro = function()
    navinha.atirando = false
  end

  return navinha
end
