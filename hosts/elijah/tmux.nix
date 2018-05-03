{ ... }:
{ programs.tmux = {
    clock24 = true;
    enable = true;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    newSession = true;
    terminal = "screen-256color";
  };
}
