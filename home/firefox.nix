{
  pkgs,
  inputs,
  ...
}: 

{ 
  programs.firefox = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "koehn";
        search.force = true;
        search.engines = {
          "Home Manager NixOs" = {
            urls = [
              {
                template = "https://mipmip.github.io/home-manager-option-search/";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@hm"];
          };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };
          "NixOS Wiki" = {
            urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
            iconUpdateURL = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["@nw"];
          };
          Bing.metaData.hidden = true;
          "Amazon.com".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
          "Google".metaData.alias = "@g";
        };

        bookmarks = [
          {    
            name = "Socials";    
            toolbar = true;    
            bookmarks = 
            [      
              {    
                name = "X";    
                tags = [ "socials" ];    
                keyword = "x";    
                url = "https://twitter.com/home";  
              }
              {    
                name = "Last.FM";    
                tags = [ "socials" ];    
                keyword = "lastfm";    
                url = "https://www.last.fm/user/chaeyeonswavv";  
              }
            ];  
          }
        ];
        settings = {
          "browser.bookmarks.addedImportButton" = false;
        };
      };
    };
}