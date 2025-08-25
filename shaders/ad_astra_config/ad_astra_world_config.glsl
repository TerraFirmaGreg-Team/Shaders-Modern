// this file is included at the end of /lib/common.glsl so it can override any user settings

// disable clouds
#ifndef WORLD_GLACIO
    #undef VL_CLOUDS_ACTIVE
#endif

#ifdef AD_ASTRA_ORBIT
    #define HAS_NO_MOON

    #define HAS_NO_ATMOSPHERE

    // In Unbound only, prevent shader from modifying vanilla sun/moon sprite
    #if SUN_MOON_STYLE >= 2
        #define UNLIT_SKY_OBJECTS
    #endif

    // Unbound preset should not render its own moon here
    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    #define DISABLE_SKY_GLARE

    // Force Unbound to use Reimagined skybox style
    #undef  SUN_MOON_STYLE_DEFINE
    #define SUN_MOON_STYLE_DEFINE 1
    // Use vanilla intensity; avoid shader brightening/halo (Unbound only)
    #if SUN_MOON_STYLE >= 2
        #define UNLIT_SKY_OBJECTS
    #endif
    #undef  LENSFLARE
    #undef  BLOOM_FOG

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
    #if SUN_MOON_STYLE >= 2
        #define UNLIT_SKY_OBJECTS
    #endif
    // Hide Unbound procedural moon on Glacio
    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    #define DISABLE_SKY_GLARE

    // Force Unbound to use Reimagined skybox style
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
    // Hide Unbound procedural moon on the Moon
    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    #define DISABLE_SKY_GLARE

    // Force Unbound to use Reimagined skybox style
    #if SUN_MOON_STYLE >= 2
        #define UNLIT_SKY_OBJECTS
    #endif

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
    // Mercury has no moon — disable Unbound moon
    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    #define DISABLE_SKY_GLARE

    // Force Unbound to use Reimagined skybox style
    #undef  SUN_MOON_STYLE_DEFINE
    #define SUN_MOON_STYLE_DEFINE 1
    #if SUN_MOON_STYLE >= 2
        #define UNLIT_SKY_OBJECTS
    #endif
    #undef  LENSFLARE
    #undef  BLOOM_FOG
#endif

#ifdef WORLD_MARS
    #define HAS_NO_MOON

    #define DISABLE_UNBOUND_MOON
    #define DISABLE_UNBOUND_SUN_MOON
    // Allow Ad Astra skybox/moons
    
    // Force Unbound to use Reimagined skybox style
    #undef  SUN_MOON_STYLE_DEFINE
    #define SUN_MOON_STYLE_DEFINE 1
    #if SUN_MOON_STYLE >= 2
        #define UNLIT_SKY_OBJECTS
    #endif
    #undef  LENSFLARE
    #undef  BLOOM_FOG
    #undef  ATM_FOG_MULT
    #define ATM_FOG_MULT 0.1
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