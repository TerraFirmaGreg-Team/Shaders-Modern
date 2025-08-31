#ifdef AD_ASTRA_ORBIT
    uniform vec3 skyColorSmooth;
    // I'm british >:3
    vec3 colour            = vec3(0.035, 0.035, 0.055);

    vec3 sunsetDownSkyColorP = colour;
    vec3 dayUpSkyColor       = colour;
    vec3 dayMiddleSkyColor   = colour;
    vec3 dayDownSkyColor     = colour;
    vec3 nightUpSkyColor     = colour;
    vec3 nightMiddleSkyColor = colour;
    vec3 nightDownSkyColor   = colour;
#elif defined WORLD_MOON
    // Soft neutral gradient; no bluish band at horizon
    const vec3 dayUp    = vec3(0.070, 0.070, 0.075);
    const vec3 dayMid   = vec3(0.060, 0.060, 0.066);
    const vec3 dayDown  = vec3(0.052, 0.052, 0.060);

    const vec3 nightUp  = vec3(0.038, 0.038, 0.044);
    const vec3 nightMid = vec3(0.034, 0.034, 0.040);
    const vec3 nightDown= vec3(0.031, 0.031, 0.037);

    vec3 sunsetDownSkyColorP  = dayDown;

    vec3 dayUpSkyColor        = dayUp;
    vec3 dayMiddleSkyColor    = dayMid;
    vec3 dayDownSkyColor      = dayDown;

    vec3 nightUpSkyColor      = nightUp;
    vec3 nightMiddleSkyColor  = nightMid;
    vec3 nightDownSkyColor    = nightDown;
#elif defined(WORLD_MARS)
    // Mars sky colors - original Taidum values for proper brightness
    const vec3 dayUp    = vec3(0.12, 0.07, 0.04); // Original Taidum values
    const vec3 dayMid   = vec3(0.10, 0.06, 0.03); // Original Taidum values
    const vec3 dayDown  = vec3(0.08, 0.05, 0.02); // Original Taidum values

    // Prevent extremely low values that break DH rendering
    const vec3 nightUp  = vec3(0.020, 0.018, 0.016);
    const vec3 nightMid = vec3(0.016, 0.014, 0.012);
    const vec3 nightDown= vec3(0.012, 0.010, 0.008);

    vec3 sunsetDownSkyColorP  = dayDown;

    vec3 dayUpSkyColor        = dayUp;
    vec3 dayMiddleSkyColor    = dayMid;
    vec3 dayDownSkyColor      = dayDown;

    vec3 nightUpSkyColor      = nightUp;
    vec3 nightMiddleSkyColor  = nightMid;
    vec3 nightDownSkyColor    = nightDown;
#endif