-- See https://github.com/windwp/nvim-autopairs
-- and https://github.com/windwp/nvim-autopairs/wiki/Rules-API
local Rule = require 'nvim-autopairs.rule'
local npairs = require 'nvim-autopairs'
local cond = require 'nvim-autopairs.conds'

npairs.add_rule(Rule('‘', '’'):with_pair(cond.not_filetypes { 'tex', 'latex', 'markdown', 'text' }))
npairs.add_rule(Rule('“', '”', { 'tex', 'latex', 'malrdown', 'text' }))
npairs.add_rule(Rule('«', '»'))
npairs.add_rules {
  Rule('<<', '', { 'markdown', 'tex', 'latex', 'text' }):replace_endpair(function()
    return '<BS><BS>«»'
  end):set_end_pair_length(1),
}
npairs.add_rules {
  Rule(' ', ' ', { '-markdown', '-text' })
    :with_pair(cond.not_before_regex '[^{%(%[]$', 1)
    :with_pair(cond.not_after_regex '^[^}%)%]]', 1)
    :with_del(cond.before_regex '[%{%[%(]', 2)
    :with_del(cond.after_regex '[%}%]%)]', 2),
}
npairs.add_rules {
  Rule(':', '', { 'markdown', 'text' })
    :with_pair(cond.after_regex('["\']', 1))
    :replace_endpair(function()
      return '<BS><Right>:'
    end)
    :set_end_pair_length(0),
}

-- LaTeX
npairs.add_rules {
  Rule(' ', ' ', { 'tex', 'latex', 'markdown' }):with_pair(cond.before_regex '[%$]'):with_pair(cond.after_regex '[%$]'),
}
npairs.add_rules {
  Rule('$', '$', { 'tex', 'latex', 'markdown' }):with_pair(cond.not_after_text '$'):with_pair(cond.not_before_text '$'):with_move(cond.done()),
}
npairs.add_rules {
  Rule('$$$', '$$', { 'tex', 'latex', 'markdown' })
    :with_pair(cond.not_after_text '$$')
    :with_move(cond.done())
    :replace_endpair(function()
      return '<BS>$$'
    end)
    :set_end_pair_length(2),
}

-- MarkDown
npairs.add_rules {
  Rule('_', '_', { 'markdown' }):with_pair(cond.not_after_text '_'):with_pair(cond.not_before_text '_'):with_move(cond.done()),
}
npairs.add_rules {
  Rule('___', '__', { 'markdown' })
    :with_pair(cond.not_after_text '__')
    :with_move(cond.done())
    :replace_endpair(function()
      return '<BS>__'
    end)
    :set_end_pair_length(2),
}
npairs.add_rules {
  Rule('*', '*', { 'markdown' }):with_pair(cond.not_after_text '*'):with_pair(cond.not_before_text '*'):with_move(cond.done()),
}
npairs.add_rules {
  Rule('***', '**', { 'markdown' })
    :with_pair(cond.not_after_text '**')
    :with_move(cond.done())
    :replace_endpair(function()
      return '<BS>**'
    end)
    :set_end_pair_length(2),
}

-- LUA
npairs.add_rule(Rule('then', 'end', 'lua'):end_wise(function(opts)
  return string.match(opts.line, '^%s*if') ~= nil
end))

npairs.add_rule(Rule('do', 'end', 'lua'):end_wise(function(opts)
  return string.match(opts.line, '^%s*for') or string.match(opts.line, '^%s*while') ~= nil
end))

npairs.add_rule(Rule('function%s*%([^%(%)]*%)$', 'end', 'lua'):use_regex(true):with_pair(cond.not_after_text 'end'):with_del(cond.none()))
npairs.add_rule(Rule('function%s*%([^%(%)]*%) ', ' ', 'lua'):use_regex(true):with_pair(cond.after_text 'end'):with_del(cond.none()))

-- VIM
npairs.add_rule(Rule('<', '>', { 'vim', 'lua', 'dosini' }))
