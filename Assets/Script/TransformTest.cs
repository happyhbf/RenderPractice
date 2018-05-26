using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TransformTest : MonoBehaviour 
{
	public Transform TestObject;
	public Transform TargetObject;

	public Vector3 TranslatePosition;


	Matrix4x4 mMatTran;

	// Use this for initialization
	void Awake () 
	{
		mMatTran = new Matrix4x4();

	}
	
	// Update is called once per frame
	void Update () 
	{
		BuildTranstateMatrix ();

		TargetObject.position = mMatTran.MultiplyPoint (TestObject.position);
	}

	void BuildTranstateMatrix()
	{
		mMatTran.SetRow(0, new Vector4(1f, 0f, 0f, TranslatePosition.x));
		mMatTran.SetRow(1, new Vector4(0f, 1f, 0f, TranslatePosition.y));
		mMatTran.SetRow(2, new Vector4(0f, 0f, 1f, TranslatePosition.z));
		mMatTran.SetRow(3, new Vector4(0f, 0f, 0f, 1f));
	}


}
