package com.example.pobrecomdinheiro


import android.content.Intent
import android.os.AsyncTask
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.annotation.RequiresApi

import androidx.recyclerview.widget.LinearLayoutManager;
import kotlinx.android.synthetic.main.activity_main.*

class HomeActivity : AppCompatActivity(), NodeListAdapter.onItemClickListener {

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
        @RequiresApi(Build.VERSION_CODES.O)
        override fun doInBackground(vararg params: Void?): List<Card>? {
            return service.getAllCoinsCards()
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
        if(note.name.toUpperCase() == "BTC") { // mostrar bitcoin primeiro
            val intent = Intent(this, CriptoListActivity::class.java)
            startActivity(intent)
        }else{
            Log.d("TAG", "deu ruim")
        }
    }
}
