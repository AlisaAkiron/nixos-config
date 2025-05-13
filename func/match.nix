value: patterns:
let
  matchPattern = pattern: if builtins.isFunction pattern then pattern value else pattern == value;

  processPatterns =
    remainingPatterns:
    if builtins.length remainingPatterns == 0 then
      throw "No pattern matched for value: ${builtins.toString value}"
    else
      let
        currentDefinition = builtins.head remainingPatterns;
        patternDefinition =
          if builtins.length currentDefinition != 2 then
            throw "Pattern definition must be a list of two elements: [ pattern action ]"
          else
            currentDefinition;

        pattern = builtins.elemAt patternDefinition 0;
        action = builtins.elemAt patternDefinition 1;
        restPatterns = builtins.tail remainingPatterns;
      in
      if matchPattern pattern then
        if builtins.isFunction action then action value else action
      else
        processPatterns restPatterns;
in
processPatterns patterns
