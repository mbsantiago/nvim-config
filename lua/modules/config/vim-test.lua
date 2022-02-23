return function()
  vim.g["test#python#pytest#options"] = "--color=yes"
  vim.g["test#javascript#jest#options"] = "--color=yes"
  vim.g["test#javascript#runner"] = "jest"
  vim.g.ultest_use_pty = 1
end
