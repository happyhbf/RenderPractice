using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// https://blog.csdn.net/silangquan/article/details/39008903

public class QuaternionsTest : MonoBehaviour
{
    public Vector3 Axis;
    public float degree;

    public Vector4 Q;
    public Quaternion RealQuaternion;

    public Vector4 TestPoint;
    public Vector4 TargetPoint;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update ()
    {
        float arc = Mathf.Deg2Rad * degree;
        float s = Mathf.Sin(arc / 2);
        Q.x = s * Axis.x;
        Q.y = s * Axis.y;
        Q.z = s * Axis.z;
        Q.w = Mathf.Cos(arc / 2);

        RealQuaternion = Quaternion.AngleAxis(degree, Axis);

        // 共轭四元数
        Vector4 ConjugateQ = Q;
        ConjugateQ.x *= -1.0f;
        ConjugateQ.y *= -1.0f;
        ConjugateQ.z *= -1.0f;

        float normalizedQ = Mathf.Sqrt(Q.x * Q.x + Q.y * Q.y + Q.z * Q.z + Q.w * Q.w);
        TargetPoint = MultiplyQ(MultiplyQ(Q, TestPoint), ConjugateQ);

    }

    Vector4 MultiplyQ(Vector4 Q1, Vector4 Q2)
    {
        Vector4 Q = new Vector4();
        float x1 = Q1.x;
        float y1 = Q1.y;
        float z1 = Q1.z;
        float w1 = Q1.w;
        float x2 = Q2.x;
        float y2 = Q2.y;
        float z2 = Q2.z;
        float w2 = Q2.w;

        Q.x = w1 * x2 + x1 * w2 + y1 * z2 - z1 * y2;
        Q.y = w1 * y2 - x1 * z2 + y1 * w2 + z1 * x2;
        Q.z = w1 * z2 + x1 * y2 - y1 * x2 + z1 * w2;
        Q.w = w1 * w2 - x1 * x2 - y1 * y2 - z1 * z2;
        return Q;
    }
}
