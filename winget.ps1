# Install New Apps
Write-Output "Installing Apps"

# Define a list of apps to install with associated metadata
$apps = @(
    # Nilesoft Shell - A context menu extender
    @{name = "Nilesoft.Shell" },

    # Microsoft PowerShell - A powerful scripting and automation tool
    @{name = "Microsoft.PowerShell" },

    # Neovim - A highly configurable text editor
    @{name = "Neovim.Neovim" },

    # Discord - A communication platform for gamers
    @{name = "Discord.Discord" },

    # Steam - A gaming platform and store
    @{name = "Valve.Steam" },

    # Spotify - A music streaming service
    @{name = "Spotify.Spotify" },

    # SteelSeries GG - SteelSeries gaming software
    @{name = "SteelSeries.GG" },

    # OBS Studio - Open Broadcaster Software for content creation
    @{name = "OBSProject.OBSStudio" },

    # Valorant NA - Valorant, a competitive game by Riot Games
    @{name = "RiotGames.Valorant.NA" },

    # Git - Version control system
    @{name = "Git.Git" },

    # Node.js LTS - JavaScript runtime
    @{name = "OpenJS.NodeJS.LTS" },

    # Obsidian - A powerful note-taking and knowledge management tool
    @{name = "Obsidian.Obsidian" },

    # WPS Office - Office suite
    @{name = "Kingsoft.WPSOffice" },

    # Malwarebytes - Anti-malware software
    @{name = "Malwarebytes.Malwarebytes" }
);

# Iterate through the list of apps
Foreach ($app in $apps) {
    # Check if the app is already installed
    $listApp = winget list --exact -q $app.name --accept-source-agreements
    
    # If the app is not installed, proceed with the installation
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-Host "Installing:" $app.name
        
        # Check if a source for the app is specified
        if ($app.source -ne $null) {
            # Install the app with a specified source
            winget install --exact --silent $app.name --source $app.source --accept-package-agreements
        }
        else {
            # Install the app without specifying a source
            winget install --exact --silent $app.name --accept-package-agreements
        }
    }
    else {
        # If the app is already installed, skip the installation
        Write-Host "Skipping Install of" $app.name
    }
}
