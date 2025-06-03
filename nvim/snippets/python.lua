local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local dl = extras.dynamic_lambda


return {
  -- def
  s("def", {
    t("def "), i(1, "func_name"), t("("), i(2, ""), t({"):", "\t"}), i(3, "pass")
  }),

  -- print
  s("pr", {
    t("print("), i(1, '"Hello, world!"'), t(")")
  }),

  -- pprint
  s("ppr", {
    t('__import__("pprint").pprint('), i(1, 'obj'), t(")")
  }),

  -- method
  s("met",{
      t('def '), i(1, "func_name"), t("(self, "), i(2), t({"):", "\t"}), i(3, "pass")
  }),
 
  -- method name: __name__
  s("pmet",{
      t('def '), t("__"), i(1, "func_name"), t("__(self, "), i(2), t({"):", "\t"}), i(3, "pass")
  }),

    -- init 
  s("init",{
      t('def '), t("__init__"), t("(self, "), i(1), t({"):", "\t"}), t("self."), rep(1), t(" = "), rep(1)
  }),


  -- log to webhook
  s("wlog", {
    t('webhook_url = "'), i(1, "/webhook-path"), t({'"', "message = str("}),
    i(2, "logging_object"),
    t({")",
       "from tests.lib.log import log",
       "import traceback",
       "formatted_traceback = traceback.format_exc()",
       'log(f"Traceback:\\n\\n{formatted_traceback}\\n\\nMessage:\\n\\n{message}", webhook_url)'
    })
  }),
}

