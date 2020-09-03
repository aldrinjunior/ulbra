package com.example.pobrecomdinheiro

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.activity_main.*

class NodeListAdapter(private val notes: List<Card>, private val onItemClicked : onItemClickListener): RecyclerView.Adapter<NodeListAdapter.ViewHolder>() {

    interface onItemClickListener {
        fun onItemClicked ( note: Card)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.note_item, parent, false);
        return ViewHolder(view);
    }

    override fun getItemCount(): Int {
        return notes.size;
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val note = notes[position];
        holder.bindView(note, onItemClicked );
    }

    class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        fun bindView(note: Card, onItemClicked: onItemClickListener) {
            val title = itemView.contentDescription
            val buy_value = itemView.somarTotal

            title[] = note.ultimoValor
//          buy_value.text = formatNumber(note.buy_value)
            buy_value.text = note.valorCompra

            itemView.setOnClickListener{
                onItemClicked.onItemClicked(note);
            }
        }
        // formatar valor da moeda
        private fun formatNumber(number: Int): String {
            return if (number < 1000) {
                number.toString()
            } else {
                (number / 1000).toString() + " k"
            }
        }
    }
}

