#
# Cookbook:: chef-arkserver
# Attributes:: default
#
# Author:: Nick Gray (f0rkz@f0rkznet.net)
#
# Copyright:: 2017 f0rkznet.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
default['steam']['user'] = 'steam'
default['steam']['steamcmd']['install_dir'] = '/opt/steam'

default['ark']['appid'] = '376030'
default['ark']['install_dir'] = '/opt/arkserver'
default['ark']['tools_dir'] = '/opt/arkserver/tools'
default['ark']['force_update'] = false

default['ark']['gameserver']['cluster'] = {
  is_enabled: false,
  ClusterID: 'arkcluster',
  ClusterSessionName: 'Unconfigured chef-arkserver cluster :: ',
  maps: ['TheIsland', 'ScorchedEarth_P', 'TheCenter', 'Ragnarok'],
  ServerBaseName: 'arkserver',
  NoTransferFromFiltering: true,
  BaseQueryPort: 27015,
  BaseListenPort: 7777
}

default['ark']['gameserver']['configuration'] = {
  # The map to use when running the server
  map: 'TheIsland',
  MaxPlayers: 70,
  ListenPort: 7777,
  QueryPort: 27015,
  EnableRcon: true,
  battleeye: true,
  ActiveMods: false,
  ShooterGameMode: {
    # Breeding Multiplier
    MatingIntervalMultiplier: 1.0,
    EggHatchSpeedMultiplier: 1.0,
    BabyMatureSpeedMultiplier: 1.0,
    BabyImprintingStatScaleMultiplier: 1.0,
    BabyCuddleIntervalMultiplier: 1.0,
    BabyCuddleGracePeriodMultiplier: 1.0,
    BabyCuddleLoseImprintQualitySpeedMultiplier: 1.0
  },
  ServerSettings: {
    AllowFlyerCarryPvE: false,
    AllowThirdPersonPlayer: false,
    AlwaysNotifyPlayerLeft: false,
    AutoSavePeriodMinutes: 15.000000,
    ClampResourceHarvestDamage: false,
    DayCycleSpeedScale: 1.000000,
    DayTimeSpeedScale: 1.000000,
    DifficultyOffset: 0.200000,
    DinoCharacterFoodDrainMultiplier: 1.000000,
    DinoCharacterHealthRecoveryMultiplier: 1.000000,
    DinoCharacterStaminaDrainMultiplier: 1.000000,
    DinoCountMultiplier: 1.000000,
    DinoDamageMultiplier: 1.000000,
    DinoResistanceMultiplier: 1.000000,
    DisableStructureDecayPvE: false,
    DontAlwaysNotifyPlayerJoined: false,
    EnablePvPGamma: false,
    GlobalVoiceChat: false,
    HarvestAmountMultiplier: 1.000000,
    HarvestHealthMultiplier: 1.000000,
    KickIdlePlayersPeriod: 2400.000000,
    NewMaxStructuresInRange: 6000.000000,
    NightTimeSpeedScale: 1.000000,
    NoTributeDownloads: false,
    PlayerCharacterFoodDrainMultiplier: 1.000000,
    PlayerCharacterHealthRecoveryMultiplier: 1.000000,
    PlayerCharacterStaminaDrainMultiplier: 1.000000,
    PlayerCharacterWaterDrainMultiplier: 1.000000,
    PlayerDamageMultiplier: 1.000000,
    PlayerResistanceMultiplier: 1.000000,
    ProximityChat: false,
    ProximityVoiceChat: false,
    PvEStructureDecayDestructionPeriod: 0.000000,
    PvEStructureDecayPeriodMultiplier: 1.000000,
    RCONEnabled: true,
    RCONPort: 27020,
    ResourcesRespawnPeriodMultiplier: 1.000000,
    ServerAdminPassword: 'ADMINPASSWORD',
    ServerCrosshair: false,
    ServerForceNoHUD: false,
    ServerHardcore: false,
    ServerPassword: '',
    ServerPVE: false,
    ShowMapPlayerLocation: false,
    StructureDamageMultiplier: 1.000000,
    StructureResistanceMultiplier: 1.000000,
    TamedDinoDamageMultiplier: 1.000000,
    TamedDinoResistanceMultiplier: 1.000000,
    TamingSpeedMultiplier: 1.000000,
    XPMultiplier: 1.000000
  },
  ShooterGameUserSettings: {
    MasterAudioVolume: 1.000000,
    MusicAudioVolume: 1.000000,
    SFXAudioVolume: 1.000000,
    VoiceAudioVolume: 1.000000,
    CameraShakeScale: 1.000000,
    bFirstPersonRiding: false,
    bThirdPersonPlayer: false,
    bShowStatusNotificationMessages: true,
    trueSkyQuality: 0.270000,
    FOVMultiplier: 1.000000,
    GroundClutterDensity: 1.000000,
    bFilmGrain: false,
    bMotionBlur: true,
    bUseDFAO: true,
    bUseSSAO: true,
    bShowChatBox: true,
    bCameraViewBob: true,
    bInvertLookY: false,
    bFloatingNames: true,
    bChatBubbles: true,
    bHideServerInfo: false,
    bJoinNotifications: false,
    bCraftablesShowAllItems: true,
    LookLeftRightSensitivity: 1.000000,
    LookUpDownSensitivity: 1.000000,
    GraphicsQuality: 2,
    ActiveLingeringWorldTiles: 10,
    ClientNetQuality: 3,
    LastServerSearchType: 0,
    LastServerSearchHideFull: false,
    LastServerSearchProtected: false,
    HideItemTextOverlay: false,
    bDistanceFieldShadowing: true,
    LODScalar: 1.000000,
    HighQualityMaterials: true,
    HighQualitySurfaces: true,
    bTemperatureF: false,
    bDisableTorporEffect: false,
    bChatShowSteamName: false,
    bChatShowTribeName: true,
    EmoteKeyBind1: 0,
    EmoteKeyBind2: 0,
    bUseVSync: false,
    ResolutionSizeX: 1280,
    ResolutionSizeY: 720,
    LastUserConfirmedResolutionSizeX: 1280,
    LastUserConfirmedResolutionSizeY: 720,
    WindowPosX: -1,
    WindowPosY: -1,
    bUseDesktopResolutionForFullscreen: false,
    FullscreenMode: 2,
    LastConfirmedFullscreenMode: 2,
    Version: 5
  },
  ScalabilityGroups: {
    ResolutionQuality: 100,
    ViewDistanceQuality: 3,
    AntiAliasingQuality: 3,
    ShadowQuality: 3,
    PostProcessQuality: 3,
    TextureQuality: 3,
    EffectsQuality: 3,
    trueSkyQuality: 3,
    GroundClutterQuality: 3,
    IBLQuality: 1,
    HeightFieldShadowQuality: 3
  },
  SessionSettings: {
    SessionName: 'Unconfigured chef-ark server'
  },
  MessageOfTheDay: {
    Duration: 30,
    Message: 'https://github.com/f0rkz/chef-arkserver'
  }
}
