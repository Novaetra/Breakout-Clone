using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Transform))]
[RequireComponent(typeof(Collider2D))]
public class BrickFieldController : MonoBehaviour
{

    public GameObject Brick;
    public int AmountOfBricks;
    private Transform _brickField;
    private Collider2D _collider;

    void Start()
    {
        _brickField = GetComponent<Transform>();
        _collider = GetComponent<Collider2D>();

        var box = Brick.GetComponent<BoxCollider2D>();
        var size = box.size - box.offset;

        float x = -_collider.bounds.extents.x, y = _collider.bounds.extents.y - size.y / 2;
        for (int i = 0; i < AmountOfBricks; i++)
        {
            var newBrick = Instantiate(Brick);
            newBrick.transform.SetParent(_brickField);
            newBrick.transform.localPosition = new Vector3(x, y, newBrick.transform.localPosition.z);
            x += size.x / 2;
            if (x >= _collider.bounds.max.x)
            {
                x = -_collider.bounds.extents.x;
                y -= size.y / 2;
            }
        }
    }

    void Update()
    {

    }
}
