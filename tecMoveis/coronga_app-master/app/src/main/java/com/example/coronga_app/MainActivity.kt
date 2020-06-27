package com.example.coronga_app

import android.content.Intent
import android.os.AsyncTask
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.AdapterView

import androidx.recyclerview.widget.LinearLayoutManager;
import kotlinx.android.synthetic.main.activity_main.*
import kotlin.math.log

class MainActivity : AppCompatActivity(), NodeListAdapter.onItemClickListener {

    val service = CardService()
    val cards = mutableListOf<Card>()
    val adapter =  NodeListAdapter(cards, this)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        CardTask().execute()

        val recyclerView = note_list_recyclerview
        recyclerView.adapter = adapter
        val layoutManager = LinearLayoutManager(this);
        recyclerView.layoutManager = layoutManager;
    }

    inner class CardTask: AsyncTask<Void, Void, List<Card>?>() {
        override fun doInBackground(vararg params: Void?): List<Card>? {
            return service.getContriesCards()
        }

        override fun onPostExecute(result: List<Card>?) {
            super.onPostExecute(result)
            if (result != null) {
                cards.clear()
                cards.addAll(result)
                adapter.notifyDataSetChanged()
            }
        }
    }

    override fun onItemClicked(note: Card) {
        if(note.titulo.toUpperCase() == "BRAZIL") {
            val intent = Intent(this, Main2Activity::class.java)
            startActivity(intent)
        }else{
            Log.d("TAG", "só abre do brasil")
        }
    }
}
