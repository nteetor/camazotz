`%||%` <- function(a, b) if (is.null(a)) b else a

# adapted from https://github.com/blakeembrey/pluralize/blob/master/pluralize.js
pluralize <- function(s) {
  rules <- list(
    's?$', 's',
    '([^aeiou]ese)$', '\\1',
    '(ax|test)is$', '\\1es',
    '(alias|[^aou]us|tlas|gas|ris)$', '\\1es',
    '(e[mn]u)s?$', '\\1s',
    '([^l]ias|[aeiou]las|[emjzr]as|[iu]am)$', '\\1',
    '(alumn|syllab|octop|vir|radi|nucle|fung|cact|stimul|termin|bacill|foc|uter|loc|strat)(?:us|i)$', '\\1i',
    '(alumn|alg|vertebr)(?:a|ae)$', '\\1ae',
    '(seraph|cherub)(?:im)?$', '\\1im',
    '(her|at|gr)o$', '\\1oes',
    '(agend|addend|millenni|dat|extrem|bacteri|desiderat|strat|candelabr|errat|ov|symposi|curricul|automat|quor)(?:a|um)$', '\\1a',
    '(apheli|hyperbat|periheli|asyndet|noumen|phenomen|criteri|organ|prolegomen|hedr|automat)(?:a|on)$', '\\1a',
    'sis$', 'ses',
    '(?:(kni|wi|li)fe|(ar|l|ea|eo|oa|hoo)f)$', '\\1\\2ves',
    '([^aeiouy]|qu)y$', '\\1ies',
    '([^ch][ieo][ln])ey$', '\\1ies',
    '(x|ch|ss|sh|zz)$', '\\1es',
    '(matr|cod|mur|sil|vert|ind|append)(?:ix|ex)$', '\\1ices',
    '(m|l)(?:ice|ouse)$', '\\1ice',
    '(pe)(?:rson|ople)$', '\\1ople',
    '(child)(?:ren)?$', '\\1ren',
    'eaux$', '\\0',
    'm[ae]n$', 'men',
    'thou', 'you'
  )
  for (regex in names(rules)) {
    if (grepl(regex, s)) {
      return(sub(regex, rules[[regex]], s))
    }
  }
}

`%s?%` <- function(s, n) {
  if (n > 1) {
    pluralize(s)
  }
}

this_is <- function(object) {
  classnm <- class(object)[1]
  indefinite <- if (grepl('^[aeiou]', classnm)) 'An' else 'A'
  paste(indefinite, classnm)
}

conjoin <- function(x) {
  paste(x, collapse = ' ')
}

pad <- function(x, n) {
  sprintf(paste0('%', n, 's'), x)
}

NCHAR <- function(x) {
  ifelse(length(nchar(x)), nchar(x), 0)
}

