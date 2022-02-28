local types = require('cmp.types')
local source = {}

source.new = function()
  local self = setmetatable({}, { __index = source })
  self.items = nil
  return self
end

function source:get_trigger_characters()
  return { "\\" }
end


function source:complete(params, callback)
  if params.completion_context.triggerCharacter == '\\'
    and params.completion_context.triggerKind == types.lsp.CompletionTriggerKind.TriggerCharacter then
    if not self.items then
      self.items = require('cmp_katex.items')
    end

    callback(self.items)
  end
end

return source

