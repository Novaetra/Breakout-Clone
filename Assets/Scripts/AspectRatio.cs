using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Camera))]
public class AspectRatio : MonoBehaviour {

	public float targetAspect;

	void Start () 
	{
		float windowAspect = (float) Screen.width / (float) Screen.height;
		float scaleHeight = windowAspect / targetAspect;
		Camera camera = GetComponent<Camera>();

		if (scaleHeight < 1.0f)
			camera.orthographicSize = camera.orthographicSize / scaleHeight;
	}
}
