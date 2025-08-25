vec3 cloudRainColor = mix(nightMiddleSkyColor, dayMiddleSkyColor, sunFactor);
#ifndef WORLD_GLACIO 
    vec3 cloudAmbientColor = mix(ambientColor * (sunVisibility2 * (0.55 + 0.1 * noonFactor) + 0.35), cloudRainColor * 0.5, rainFactor);
    vec3 cloudLightColor   = mix(lightColor * (0.9 + 0.2 * noonFactor), cloudRainColor * 0.25, noonFactor * rainFactor);
#else
    vec3 cloudAmbientColor = vec3(0.9,0.2,0.8) * (sunVisibility2 * (0.55 + 0.1 * noonFactor) + 0.35);
    vec3 cloudLightColor   = vec3(0.8,0.5,0.7) * (0.9 + 0.2 * noonFactor);
#endif

