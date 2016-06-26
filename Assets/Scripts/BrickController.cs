using UnityEngine;
using System.Collections;

public class BrickController : MonoBehaviour
{

    public SpriteRenderer SpriteRenderer;
    public Color MinColor;
    public Color MaxColor;

    void Start()
    {
        if (SpriteRenderer == null) return;
        float minH, minS, minV, maxH, maxS, maxV;
        Color.RGBToHSV(MinColor, out minH, out minS, out minV);
        Color.RGBToHSV(MaxColor, out maxH, out maxS, out maxV);
        SpriteRenderer.color = Random.ColorHSV(minH, maxH, minS, maxS, minV, maxV);
    }

    void Update()
    {

    }
}
