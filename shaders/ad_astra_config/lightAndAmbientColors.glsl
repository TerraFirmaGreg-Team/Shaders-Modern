#if defined WORLD_MOON
    // Neutral, brighter lunar lighting (no blue tint)
    #ifndef COMPOSITE
        vec3 noonClearLightColor = vec3(0.78, 0.76, 0.74) * 1.35; // ground/cloud light
    #else
        vec3 noonClearLightColor = vec3(0.38);                    // light shaft
    #endif
    vec3 noonClearAmbientColor = vec3(0.22);

    #ifndef COMPOSITE
        vec3 sunsetClearLightColor = vec3(0.58) * (1.0 + 0.20 * invNoonFactor);
    #else
        vec3 sunsetClearLightColor = vec3(0.26) * (1.0 + 0.20 * invNoonFactor);
    #endif
    vec3 sunsetClearAmbientColor = vec3(0.16);

    #if !defined COMPOSITE && !defined DEFERRED1
        vec3 nightClearLightColor = vec3(0.12, 0.12, 0.14) * (0.45 + vsBrightness * 0.35);
    #elif defined DEFERRED1
        vec3 nightClearLightColor = vec3(0.12, 0.12, 0.14);
    #else
        vec3 nightClearLightColor = vec3(0.12, 0.12, 0.14);
    #endif
    vec3 nightClearAmbientColor = vec3(0.10) * (1.15 + vsBrightness * 0.55);

    // rainFactor is 0 on Moon from the world config; keep placeholders harmless
    vec3 dayRainLightColor    = vec3(0.20);
    vec3 dayRainAmbientColor  = vec3(0.20);
    vec3 nightRainLightColor  = vec3(0.10);
    vec3 nightRainAmbientColor= vec3(0.11);

    #ifndef COMPOSITE
        float noonFactorDM = noonFactor;
    #else
        float noonFactorDM = noonFactor * noonFactor;
    #endif
    vec3 dayLightColor   = mix(sunsetClearLightColor,  noonClearLightColor,   noonFactorDM);
    vec3 dayAmbientColor = mix(sunsetClearAmbientColor,noonClearAmbientColor, noonFactorDM);

    vec3 clearLightColor   = mix(nightClearLightColor,   dayLightColor,   sunVisibility2);
    vec3 clearAmbientColor = mix(nightClearAmbientColor, dayAmbientColor, sunVisibility2);

    vec3 rainLightColor   = mix(nightRainLightColor,  dayRainLightColor,  sunVisibility2) * 2.5;
    vec3 rainAmbientColor = mix(nightRainAmbientColor,dayRainAmbientColor,sunVisibility2);

    vec3 lightColor   = mix(clearLightColor,   rainLightColor,   rainFactor);
    vec3 ambientColor = mix(clearAmbientColor, rainAmbientColor, rainFactor);
#elif defined(WORLD_MERCURY)
    #ifndef COMPOSITE
	    vec3 noonClearLightColor = vec3(0.76, 0.57, 0.36) * 1.9; //ground and cloud color
    #else
        vec3 noonClearLightColor = vec3(0.1, 0.3, 0.22); //light shaft color
    #endif
    vec3 noonClearAmbientColor = pow(skyColor, vec3(0.65)) * 0.85;

    #ifndef COMPOSITE
	    vec3 sunsetClearLightColor = pow(vec3(0.8, 0.51, 0.2), vec3(1.5 + invNoonFactor)) * 5.0; //ground and cloud color
    #else
        vec3 sunsetClearLightColor = pow(vec3(0.0, 0.0, 0.0), vec3(1.5 + invNoonFactor)) * 6.8; //light shaft color
    #endif
    vec3 sunsetClearAmbientColor   = noonClearAmbientColor * vec3(1, 0.74, 0.52) * 0.95;

    #if !defined COMPOSITE && !defined DEFERRED1
        vec3 nightClearLightColor = vec3(1.82, 1.49, 1.31) * (0.4 + vsBrightness * 0.4); //ground color
    #elif defined DEFERRED1
        vec3 nightClearLightColor = vec3(0.11, 0.14, 0.20); //cloud color
    #else
        vec3 nightClearLightColor = vec3(0.07, 0.12, 0.27); //light shaft color
    #endif
    vec3 nightClearAmbientColor   = vec3(0.09, 0.12, 0.17) * (1.55 + vsBrightness * 0.77);

    vec3 dayRainLightColor   = vec3(0.21, 0.16, 0.13) * 0.85;
    vec3 dayRainAmbientColor = vec3(0.2, 0.2, 0.25) * 2.3;

    vec3 nightRainLightColor   = vec3(0.03, 0.035, 0.05) * (0.5 + 0.5 * vsBrightness);
    vec3 nightRainAmbientColor = vec3(0.16, 0.20, 0.3) * (0.75 + 0.6 * vsBrightness);

    #ifndef COMPOSITE
        float noonFactorDM = noonFactor; //ground and cloud factor
    #else
        float noonFactorDM = noonFactor * noonFactor; //light shaft factor
    #endif
    vec3 dayLightColor   = mix(sunsetClearLightColor, noonClearLightColor, noonFactorDM);
    vec3 dayAmbientColor = mix(sunsetClearAmbientColor, noonClearAmbientColor, noonFactorDM);

    vec3 clearLightColor   = mix(nightClearLightColor, dayLightColor, sunVisibility2);
    vec3 clearAmbientColor = mix(nightClearAmbientColor, dayAmbientColor, sunVisibility2);

    vec3 rainLightColor   = mix(nightRainLightColor, dayRainLightColor, sunVisibility2) * 2.5;
    vec3 rainAmbientColor = mix(nightRainAmbientColor, dayRainAmbientColor, sunVisibility2);

    vec3 lightColor   = mix(clearLightColor, rainLightColor, rainFactor);
    vec3 ambientColor = mix(clearAmbientColor, rainAmbientColor, rainFactor);
#elif defined(WORLD_MARS)
    #ifndef COMPOSITE
	    vec3 noonClearLightColor = vec3(0.45, 0.20, 0.08) * 1.2;
    #else
        vec3 noonClearLightColor = vec3(0.4, 0.18, 0.06);
    #endif
    vec3 noonClearAmbientColor = pow(skyColor, vec3(0.65)) * 0.85;

    #ifndef COMPOSITE
	    vec3 sunsetClearLightColor = pow(vec3(0.35, 0.30, 0.35), vec3(1.5 + invNoonFactor)) * 1.5;
    #else
        vec3 sunsetClearLightColor = pow(vec3(0.25, 0.25, 0.30), vec3(1.5 + invNoonFactor)) * 3.8;
    #endif
    vec3 sunsetClearAmbientColor   = noonClearAmbientColor * vec3(0.75, 0.65, 0.65) * 0.65;

    #if !defined COMPOSITE && !defined DEFERRED1
        vec3 nightClearLightColor = vec3(0.02, 0.02, 0.02) * (0.2 + vsBrightness * 0.2);
    #elif defined DEFERRED1
        vec3 nightClearLightColor = vec3(0.015, 0.015, 0.015);
    #else
        vec3 nightClearLightColor = vec3(0.02, 0.02, 0.02);
    #endif
    vec3 nightClearAmbientColor   = vec3(0.008, 0.008, 0.008) * (0.8 + vsBrightness * 0.4);

    vec3 dayRainLightColor   = vec3(0.18, 0.12, 0.08) * 0.85;
    vec3 dayRainAmbientColor = vec3(0.15, 0.12, 0.18) * 2.3;

    vec3 nightRainLightColor   = vec3(0.02, 0.015, 0.03) * (0.5 + 0.5 * vsBrightness);
    vec3 nightRainAmbientColor = vec3(0.12, 0.08, 0.15) * (0.75 + 0.6 * vsBrightness);

    #ifndef COMPOSITE
        float noonFactorDM = noonFactor; //ground and cloud factor
    #else
        float noonFactorDM = noonFactor * noonFactor; //light shaft factor
    #endif
    vec3 dayLightColor   = mix(sunsetClearLightColor, noonClearLightColor, noonFactorDM);
    vec3 dayAmbientColor = mix(sunsetClearAmbientColor, noonClearAmbientColor, noonFactorDM);

    vec3 clearLightColor   = mix(nightClearLightColor, dayLightColor, sunVisibility2);
    vec3 clearAmbientColor = mix(nightClearAmbientColor, dayAmbientColor, sunVisibility2);

    vec3 rainLightColor   = mix(nightRainLightColor, dayRainLightColor, sunVisibility2) * 2.5;
    vec3 rainAmbientColor = mix(nightRainAmbientColor, dayRainAmbientColor, sunVisibility2);

    vec3 lightColor   = mix(clearLightColor, rainLightColor, rainFactor);
    vec3 ambientColor = mix(clearAmbientColor, rainAmbientColor, rainFactor);
#elif defined(WORLD_GLACIO)
    #ifndef COMPOSITE
	    vec3 noonClearLightColor = vec3(0.6, 0.55, 0.7) * 1.9; //ground and cloud color
    #else
        vec3 noonClearLightColor = vec3(0.5, 0.2, 0.3); //light shaft color
    #endif
    vec3 noonClearAmbientColor = pow(skyColor, vec3(0.65)) * 0.85;

    #ifndef COMPOSITE
	    vec3 sunsetClearLightColor = pow(vec3(0.5, 0.45, 0.6), vec3(1.5 + invNoonFactor)) * 5.0; //ground and cloud color
    #else
        vec3 sunsetClearLightColor = pow(vec3(0.62, 0.39, 0.24), vec3(1.5 + invNoonFactor)) * 6.8; //light shaft color
    #endif
    vec3 sunsetClearAmbientColor   = noonClearAmbientColor * vec3(1.21, 0.92, 0.76) * 0.95;

    #if !defined COMPOSITE && !defined DEFERRED1
        vec3 nightClearLightColor = vec3(0.15, 0.14, 0.20) * (0.4 + vsBrightness * 0.4); //ground color
    #elif defined DEFERRED1
        vec3 nightClearLightColor = vec3(0.3, 0.14, 0.40); //cloud color
    #else
        vec3 nightClearLightColor = vec3(0.07, 0.12, 0.27); //light shaft color
    #endif
    vec3 nightClearAmbientColor   = vec3(0.09, 0.12, 0.17) * (1.55 + vsBrightness * 0.77);

    vec3 dayRainLightColor   = vec3(0.21, 0.16, 0.13) * 0.85;
    vec3 dayRainAmbientColor = vec3(0.2, 0.2, 0.25) * 2.3;

    vec3 nightRainLightColor   = vec3(0.03, 0.035, 0.05) * (0.5 + 0.5 * vsBrightness);
    vec3 nightRainAmbientColor = vec3(0.16, 0.20, 0.3) * (0.75 + 0.6 * vsBrightness);

    #ifndef COMPOSITE
        float noonFactorDM = noonFactor; //ground and cloud factor
    #else
        float noonFactorDM = noonFactor * noonFactor; //light shaft factor
    #endif
    vec3 dayLightColor   = mix(sunsetClearLightColor, noonClearLightColor, noonFactorDM);
    vec3 dayAmbientColor = mix(sunsetClearAmbientColor, noonClearAmbientColor, noonFactorDM);

    vec3 clearLightColor   = mix(nightClearLightColor, dayLightColor, sunVisibility2);
    vec3 clearAmbientColor = mix(nightClearAmbientColor, dayAmbientColor, sunVisibility2);

    vec3 rainLightColor   = mix(nightRainLightColor, dayRainLightColor, sunVisibility2) * 2.5;
    vec3 rainAmbientColor = mix(nightRainAmbientColor, dayRainAmbientColor, sunVisibility2);

    vec3 lightColor   = mix(clearLightColor, rainLightColor, rainFactor);
    vec3 ambientColor = mix(clearAmbientColor, rainAmbientColor, rainFactor);
#else
    #ifndef COMPOSITE
	    vec3 noonClearLightColor = vec3(0.6, 0.6, 0.6) * 1.9; //ground and cloud color
    #else
        vec3 noonClearLightColor = vec3(0.4, 0.7, 1.4); //light shaft color
    #endif
    vec3 noonClearAmbientColor = pow(skyColor, vec3(0.65)) * 0.85;

    #ifndef COMPOSITE
	    vec3 sunsetClearLightColor = pow(vec3(0.6, 0.6, 0.6), vec3(1.5 + invNoonFactor)) * 5.0; //ground and cloud color
    #else
        vec3 sunsetClearLightColor = pow(vec3(0.26, 0.26, 0.34), vec3(1.5 + invNoonFactor)) * 6.8; //light shaft color
    #endif
    vec3 sunsetClearAmbientColor   = noonClearAmbientColor * vec3(0.76, 0.92, 1.21) * 0.95;

    #if !defined COMPOSITE && !defined DEFERRED1
        vec3 nightClearLightColor = vec3(0.15, 0.14, 0.20) * (0.4 + vsBrightness * 0.4); //ground color
    #elif defined DEFERRED1
        vec3 nightClearLightColor = vec3(0.11, 0.14, 0.20); //cloud color
    #else
        vec3 nightClearLightColor = vec3(0.07, 0.12, 0.27); //light shaft color
    #endif
    vec3 nightClearAmbientColor   = vec3(0.09, 0.12, 0.17) * (1.55 + vsBrightness * 0.77);

    vec3 dayRainLightColor   = vec3(0.21, 0.16, 0.13) * 0.85;
    vec3 dayRainAmbientColor = vec3(0.2, 0.2, 0.25) * 2.3;

    vec3 nightRainLightColor   = vec3(0.03, 0.035, 0.05) * (0.5 + 0.5 * vsBrightness);
    vec3 nightRainAmbientColor = vec3(0.16, 0.20, 0.3) * (0.75 + 0.6 * vsBrightness);

    #ifndef COMPOSITE
        float noonFactorDM = noonFactor; //ground and cloud factor
    #else
        float noonFactorDM = noonFactor * noonFactor; //light shaft factor
    #endif
    vec3 dayLightColor   = mix(sunsetClearLightColor, noonClearLightColor, noonFactorDM);
    vec3 dayAmbientColor = mix(sunsetClearAmbientColor, noonClearAmbientColor, noonFactorDM);

    vec3 clearLightColor   = mix(nightClearLightColor, dayLightColor, sunVisibility2);
    vec3 clearAmbientColor = mix(nightClearAmbientColor, dayAmbientColor, sunVisibility2);

    vec3 rainLightColor   = mix(nightRainLightColor, dayRainLightColor, sunVisibility2) * 2.5;
    vec3 rainAmbientColor = mix(nightRainAmbientColor, dayRainAmbientColor, sunVisibility2);

    vec3 lightColor   = mix(clearLightColor, rainLightColor, rainFactor);
    vec3 ambientColor = mix(clearAmbientColor, rainAmbientColor, rainFactor);
#endif