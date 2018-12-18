using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Money : MonoBehaviour {


    public static int MoneyValue = 0;
    public Text money;
    public GameObject coin;

	// Use this for initialization
	void Start () {

        money = GetComponent<Text>();
		
	}
	
	// Update is called once per frame
	void Update () {
        money.text = MoneyValue.ToString();
	}
    public void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Player")
        {
            MoneyValue = MoneyValue + 1;
            Destroy(gameObject);

        }
    }

}
