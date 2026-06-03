{ ... }:
{
  services.mako = {
    enable = true;
    settings = {
      font = "JetBrains Mono Nerd Font";
      background-color = "#000000"; 
      text-color = "#FFFFFF";
      border-color = "#FFFFFF"; 
      
      border-size = 2;
      border-radius = 4;
      
      width = 300;
      height = 100;
      padding = "15";
      margin = "20";
      
      progress-color = "over #313244";
      
      default-timeout = 5000;
      icons = true;
      max-icon-size = 48;
    };
  };
}
