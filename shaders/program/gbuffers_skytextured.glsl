/////////////////////////////////////
// Complementary Shaders by EminGT //
/////////////////////////////////////

//Common//
#include "/lib/common.glsl"

//////////Fragment Shader//////////Fragment Shader//////////Fragment Shader//////////
#ifdef FRAGMENT_SHADER

in vec2 texCoord;

flat in vec4 glColor;

#ifdef OVERWORLD
    flat in vec3 upVec, sunVec;
#endif

//Pipeline Constants//

//Common Variables//
#ifdef OVERWORLD
    float SdotU = dot(sunVec, upVec);
    float sunVisibility = clamp(SdotU + 0.0625, 0.0, 0.125) / 0.125;
    float sunVisibility2 = sunVisibility * sunVisibility;
#endif

//Common Functions//

//Includes//
#include "/lib/colors/lightAndAmbientColors.glsl"

#ifdef CAVE_FOG
    #include "/lib/atmospherics/fog/caveFactor.glsl"
#endif

#ifdef COLOR_CODED_PROGRAMS
    #include "/lib/misc/colorCodedPrograms.glsl"
#endif

//Program//
void main() {
    #ifdef OVERWORLD
        vec2 tSize = textureSize(tex, 0);
        vec4 color = texture2D(tex, texCoord);
        color.rgb *= glColor.rgb;

        #ifndef UNLIT_SKY_OBJECTS

        vec4 screenPos = vec4(gl_FragCoord.xy / vec2(viewWidth, viewHeight), gl_FragCoord.z, 1.0);
        vec4 viewPos = gbufferProjectionInverse * (screenPos * 2.0 - 1.0);
        viewPos /= viewPos.w;
        vec3 nViewPos = normalize(viewPos.xyz);

        float VdotS = dot(nViewPos, sunVec);
        float VdotU = dot(nViewPos, upVec);

        #ifdef IS_IRIS
            bool isSun = renderStage == MC_RENDER_STAGE_SUN;
            bool isMoon = renderStage == MC_RENDER_STAGE_MOON;
        #else
            bool tSizeCheck = abs(tSize.y - 264.0) < 248.5; //tSize.y must range from 16 to 512
            bool sunSideCheck = VdotS > 0.0;
            bool isSun = tSizeCheck && sunSideCheck;
            bool isMoon = tSizeCheck && !sunSideCheck;
        #endif

        if (isSun || isMoon) {
            // Keep vanilla sun/moon on both Reimagined and Unbound presets
            // #if SUN_MOON_STYLE >= 2
            //     discard;
            // #endif
            
            // #ifdef UNLIT_SKY_OBJECTS
            //     discard;
            // #endif

            if (isSun) {
                #if defined(WORLD_MOON) || defined(WORLD_MARS) || defined(WORLD_MERCURY) || defined(WORLD_GLACIO) || defined(AD_ASTRA_ORBIT)
                    // Use bright consistent sun color on Ad Astra worlds
                    vec3 sunLightColor = vec3(1.0, 0.95, 0.85); // Bright warm sun color
                    color.rgb *= dot(color.rgb, color.rgb) * sunLightColor * 3.2;
                #else
                    color.rgb *= dot(color.rgb, color.rgb) * normalize(lightColor) * 3.2;
                #endif
                color.rgb *= 0.25 + (0.75 - 0.25 * rainFactor) * sunVisibility2;
            }

            if (isMoon) {
                color.rgb *= smoothstep1(min1(length(color.rgb))) * 1.3;
            }

            color.rgb *= GetHorizonFactor(VdotU);

            #ifdef CAVE_FOG
                color.rgb *= 1.0 - 0.75 * GetCaveFactor();
            #endif
        } else { // Custom Sky
            #if MC_VERSION >= 11300
                // Preserve Ad Astra planets (like Earth) without excessive darkening
                color.rgb *= vec3(1.5, 1.5, 1.2);
            #else
                discard;
                // Old mc custom skyboxes are weirdly broken, so we discard.
            #endif
        }

        if (isEyeInWater == 1) color.rgb *= 0.25;

        #ifdef SUN_MOON_DURING_RAIN
            color.a *= 1.0 - 0.8 * rainFactor;
        #else
            color.a *= 1.0 - rainFactor;
        #endif
        #endif // UNLIT_SKY_OBJECTS
    #endif

    #ifdef NETHER
        vec4 color = vec4(0.0);
    #endif

    #ifdef END
        vec4 color = vec4(endSkyColor, 1.0);
    #endif

    #ifdef COLOR_CODED_PROGRAMS
        ColorCodeProgram(color, -1);
    #endif

    /* DRAWBUFFERS:0 */
    gl_FragData[0] = color;
}

#endif

//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////
#ifdef VERTEX_SHADER

out vec2 texCoord;

flat out vec4 glColor;

#ifdef OVERWORLD
    flat out vec3 upVec, sunVec;
#endif

//Attributes//

//Common Variables//

//Common Functions//

//Includes//

//Program//
void main() {
    gl_Position = ftransform();
    texCoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;

    glColor = gl_Color;

    #ifdef OVERWORLD
        upVec = normalize(gbufferModelView[1].xyz);
        sunVec = GetSunVector();
    #endif
}

#endif
