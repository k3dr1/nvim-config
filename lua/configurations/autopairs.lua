--local Rule = require('nvim-autopairs.rule')
--local npairs = require('nvim-autopairs')
--local cond = require('nvim-autopairs.conds')
--
---- Enables auto-pairing when in .c & .cpp files, and when there is either
---- "#include " or "template" before the cursor
--npairs.add_rules({
--    Rule("<", ">", { "c", "cpp" })
--        :with_pair(
--            function(text)
--                return (cond.before_text("#include ")(text) or cond.before_text("template")(text))
--            end)
--        :with_del(cond.none())
--})
