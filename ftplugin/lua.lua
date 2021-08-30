

local ok, cmp = pcall(function() require'cmp' end)

if ok then
  cmp.setup.buffer{
    sources = {
      { name = 'nvim_lua' },
      { name = 'buffer' },
    }
  }
end
