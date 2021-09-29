local source = {}

source.new = function()
  local self = setmetatable({}, { __index = source })
  self.items = nil
  return self
end

-- source.get_trigger_characters = function()
--   return { '\\' }
-- end

source.complete = function(self, request, callback)
  if not self.items then
    self.items = require('cmp_katex.items')
  end

  callback(self.items)
end

return source

