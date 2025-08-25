#include "/lib/colors/skyColors.glsl"

float GetStarNoise(vec2 pos) {
    return fract(sin(dot(pos, vec2(12.9898, 4.1414))) * 43758.54953);
}

vec2 GetStarCoord(vec3 viewPos, float sphereness) {
    vec3 wpos = normalize((gbufferModelViewInverse * vec4(viewPos * 1000.0, 1.0)).xyz);
    #ifdef HORIZON_WRAPAROUND
    if (wpos.y < 0.0) {
        wpos.y = -wpos.y;
        wpos.x = -wpos.x;
    }
    #endif
    vec3 starCoord = wpos / (wpos.y + length(wpos.xz) * sphereness);
    vec3 moonPos;
    #if defined HORIZON_WRAPAROUND || defined NEBULA_AT_DAY || defined STARS_AT_DAY
    if (nightFactor > 0.0) {
	    moonPos = vec3(gbufferModelViewInverse * vec4(-sunVec * 70.0, 1.0));
    } else {
	    moonPos = vec3(gbufferModelViewInverse * vec4(sunVec * 70.0, 1.0));
    }
    #else
	    moonPos = vec3(gbufferModelViewInverse * vec4(-sunVec * 70.0, 1.0));
    #endif
	vec3 moonCoord = moonPos / (moonPos.y + length(moonPos.xz) * sphereness);
	return starCoord.xz - moonCoord.xz;
}

vec3 GetStars(vec2 starCoord, float VdotU, float VdotS) {
	#ifndef HORIZON_WRAPAROUND
    if (VdotU < 0.0) return vec3(0.0);
    #endif

    starCoord *= 0.2;
    float starFactor = 1024.0;
    starCoord = floor(starCoord * starFactor) / starFactor;

    float star = 1.0;
    star *= GetStarNoise(starCoord.xy);
    star *= GetStarNoise(starCoord.xy+0.1);
    star *= GetStarNoise(starCoord.xy+0.23);

    #if NIGHT_STAR_AMOUNT == 2
        star -= 0.7;
    #else
        star -= 0.6;
        star *= 0.65;
    #endif
    star = max0(star);
    star *= star;

	#ifndef HORIZON_WRAPAROUND
	    float starFogFactor = min1(VdotU * 3.0);
    #else
		#ifdef FADE_OUT_ATMOSPHERE
            float starFogFactor = mix(clamp01(VdotU * 3.0), 1.0, atmFadeoutFactor);
        #else
            float starFogFactor = 1.0;
        #endif
    #endif
    star *= starFogFactor;
    #ifndef STARS_AT_DAY
    star *= mix((1.0 - sunVisibility), 1.0, atmFadeoutFactor);
    #endif
    star *= max0(1.0 - pow(abs(VdotS) * 1.002, 100.0));

    vec3 stars = 40.0 * star * vec3(0.38, 0.4, 0.5) * mix(invRainFactor, 1.0, atmFadeoutFactor);

    return stars;
}