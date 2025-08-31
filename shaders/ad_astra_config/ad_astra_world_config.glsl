// this file is included at the end of /lib/common.glsl so it can override any user settings

// disable clouds
#ifndef WORLD_GLACIO
    #undef VL_CLOUDS_ACTIVE
#endif

#ifdef AD_ASTRA_ORBIT
    #define HAS_NO_MOON

    #define HAS_NO_ATMOSPHERE

    // Disable Unbound's procedural sun/moon, keep vanilla sun/moon on both presets
    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    // Allow vanilla sun glare in Orbit

    // Allow original preset choice, but disable procedural sun/moon
    // #undef  SUN_MOON_STYLE_DEFINE
    // #define SUN_MOON_STYLE_DEFINE 1
    
    // Keep all bloom and lens flare effects for sun
    // #undef  LENSFLARE
    // #undef  BLOOM_FOG

    // change stars.glsl and nightNebula.glsl to not disappear or break below the horizon
    #define HORIZON_WRAPAROUND

    #define NEBULA_AT_DAY
    #define STARS_AT_DAY
    #undef  ATM_FOG_MULT
    #define ATM_FOG_MULT 0.0
    #undef  LIGHTSHAFTS_ACTIVE
    #define LIGHTSHAFTS_ACTIVE 0
    #undef  LIGHTSHAFT_BEHAVIOUR
    #define LIGHTSHAFT_BEHAVIOUR 0
#endif

#ifdef WORLD_GLACIO
    #define HAS_NO_MOON
    #define STARS_AT_DAY
    
    // Disable Unbound's procedural sun/moon, keep vanilla sun/moon on both presets
    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    // Allow vanilla sun glare on Glacio

    // Force Unbound to use Reimagined skybox style (always use vanilla sun/moon)
    #undef  SUN_MOON_STYLE_DEFINE
    #define SUN_MOON_STYLE_DEFINE 1
    #undef  LENSFLARE
    #undef  BLOOM_FOG
#endif
#ifdef WORLD_MOON
    #define HAS_NO_MOON
    #define NEBULA_AT_DAY
    #define STARS_AT_DAY
    #define HAS_NO_ATMOSPHERE
    
    // Disable Unbound's procedural sun/moon, keep vanilla sun/moon on both presets
    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    // Allow vanilla sun glare and bloom on Moon

    // Allow original preset choice, but disable procedural sun/moon
    // #undef  SUN_MOON_STYLE_DEFINE
    // #define SUN_MOON_STYLE_DEFINE 1

    // Keep all bloom and lens flare effects for sun
    // #undef  LENSFLARE
    // #undef  BLOOM_FOG

    #undef  ATM_FOG_MULT
    #define ATM_FOG_MULT 0.0
    #undef  LIGHTSHAFTS_ACTIVE
    #define LIGHTSHAFTS_ACTIVE 0
    #undef  LIGHTSHAFT_BEHAVIOUR
    #define LIGHTSHAFT_BEHAVIOUR 0
#endif

#ifdef WORLD_MERCURY
    #define HAS_NO_MOON
    #define NEBULA_AT_DAY
    #define STARS_AT_DAY
    
    // Disable Unbound's procedural sun/moon, keep vanilla sun/moon on both presets
    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    // Allow vanilla sun glare on Mercury

    // Allow original preset choice, but disable procedural sun/moon
    // #undef  SUN_MOON_STYLE_DEFINE
    // #define SUN_MOON_STYLE_DEFINE 1
    
    // Keep all bloom and lens flare effects for sun
    // #undef  LENSFLARE
    // #undef  BLOOM_FOG
#endif

#ifdef WORLD_MARS
    #define HAS_NO_MOON

    // Disable Unbound's procedural sun/moon, keep vanilla sun/moon on both presets
    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    // Allow vanilla sun glare and bloom on Mars
    
    // Allow original preset choice, but disable procedural sun/moon
    // #undef  SUN_MOON_STYLE_DEFINE
    // #define SUN_MOON_STYLE_DEFINE 1
    
    // Keep all bloom and lens flare effects for sun
    // #undef  LENSFLARE
    // #undef  BLOOM_FOG
    #undef  ATM_FOG_MULT
    #define ATM_FOG_MULT 0.0
    #undef  LIGHTSHAFTS_ACTIVE
    #define LIGHTSHAFTS_ACTIVE 1
    #undef  LIGHTSHAFT_BEHAVIOUR
    #define LIGHTSHAFT_BEHAVIOUR 1
#endif

#ifdef HAS_NO_ATMOSPHERE
    #undef LIGHTSHAFTS_ACTIVE
    #define LIGHTSHAFT_BEHAVIOUR 0
    #define rainFactor 0
    #define invRainFactor 1
#endif