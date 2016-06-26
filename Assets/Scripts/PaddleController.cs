using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Rigidbody2D))]
[RequireComponent(typeof(Collider2D))]
public class PaddleController : MonoBehaviour
{
    public float MaxSpeed;
    public float MaxLeft;
    public float MaxRight;
    private Collider2D _collider;
    private Rigidbody2D _rigidbody;

    void Start()
    {
        _rigidbody = GetComponent<Rigidbody2D>();
        _collider = GetComponent<Collider2D>();
    }

    void FixedUpdate()
    {
        float move = Input.GetAxis("Horizontal");
        _rigidbody.velocity = (_rigidbody.position.x - _collider.bounds.extents.x > MaxLeft && move < 0) ||
                              (_rigidbody.position.x + _collider.bounds.extents.x < MaxRight && move > 0)
            ? new Vector2(move * MaxSpeed, 0)
            : new Vector2();
    }
}
