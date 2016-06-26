using System;
using UnityEngine;
using System.Collections;
using Random = UnityEngine.Random;

[RequireComponent(typeof(Rigidbody2D))]
public class BallController : MonoBehaviour
{
    public float InitialSpeed;
    public float MaxSpeed;
    public float MinSpeed;
    private Rigidbody2D _rigidbody;
    private TrailRenderer _trailRenderer;
    private Vector3 _startingPosition;

    void Start()
    {
        _rigidbody = GetComponent<Rigidbody2D>();
        _trailRenderer = GetComponent<TrailRenderer>();
        _startingPosition = gameObject.transform.position;
        StartCoroutine(SpawnBall());
    }

    private IEnumerator SpawnBall()
    {
        _trailRenderer.enabled = false;
        yield return new WaitForSeconds(1f);
        gameObject.transform.position = _startingPosition;
        _rigidbody.velocity = InitialSpeed * Random.insideUnitCircle;
        StartCoroutine(EnableTrail());
    }

    private IEnumerator EnableTrail()
    {
        yield return new WaitForFixedUpdate();
        _trailRenderer.enabled = true;
    }

    void FixedUpdate()
    {
        if (_rigidbody.velocity.magnitude > MaxSpeed)
            _rigidbody.velocity = _rigidbody.velocity.normalized * MaxSpeed;
        else if (_rigidbody.velocity.magnitude < MinSpeed)
            _rigidbody.velocity = _rigidbody.velocity.normalized * MinSpeed;
    }

    void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject.tag == "Destroyable")
        {
            Destroy(col.gameObject);
        }
    }

    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.name == "Respawn")
            StartCoroutine(SpawnBall());
    }
}
