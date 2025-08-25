// this is the configuration file for the non-adastra-specific modifications made to the shader for the taidumcraft modpack

#if defined(AD_ASTRA) && !defined(AD_ASTRA_ORBIT) || defined(OVERWORLD)
#define FADE_OUT_ATMOSPHERE
// used for fadeout atmosphere to have the stars wrap around
#define HORIZON_WRAPAROUND
// this is based on player camera position (aka eye position) not player position
// player eye height is 1.62 units above player position so add 1.62 to the Y axis you get from the F3 menu if you want to be super accurate
#define FADE_OUT_ATMOSPHERE_START_HEIGHT 400.0
#define FADE_OUT_ATMOSPHERE_END_HEIGHT 550.0

float getAtmosphereFadeoutFactor(vec3 camPos) {
    return (clamp((camPos.y - FADE_OUT_ATMOSPHERE_START_HEIGHT) / (FADE_OUT_ATMOSPHERE_END_HEIGHT - FADE_OUT_ATMOSPHERE_START_HEIGHT), 0.0, 1.0));
}
#endif