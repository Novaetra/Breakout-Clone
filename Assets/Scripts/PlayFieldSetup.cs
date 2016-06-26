using UnityEngine;
using System.Collections;

public class PlayFieldSetup : MonoBehaviour
{
    public Vector2 Corner1;
    public Vector2 Corner2;
    public Vector2 Corner3;
    public Vector2 Corner4;

    void Start()
    {
        var edgeCollider = gameObject.AddComponent<EdgeCollider2D>();
        edgeCollider.points = new[] { Corner1, Corner2, Corner3, Corner4 };


        var respawnGameObject = new GameObject { name = "Respawn" };
        respawnGameObject.transform.parent = gameObject.transform;

        var bottomCollider = respawnGameObject.AddComponent<EdgeCollider2D>();
        bottomCollider.isTrigger = true;
        bottomCollider.name = "Respawn";
        bottomCollider.points = new[] { Corner1, Corner4 };
    }
}
