package dto;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer,Item> map;

    public Cart() {
        this.map = new HashMap<>();
    }
    
    public void add(Item item){
        if (item == null) return;
        
        int id = item.getId();
        if(this.map.containsKey(id)){
            //nếu trong map đã có item thì tăng quantity
            Item currentItem = this.map.get(id);
            currentItem.setQuantity(currentItem.getQuantity()+item.getQuantity());
        }else{
            //nếu trong map chưa có item thì thêm item vào map
            this.map.put(id, item);
        }
    }
    
    public Collection<Item> getItems(){
        return this.map.values();
    }
    
    public double getTotal(){
        double total = 0;
        for(Item item:this.map.values()){
            total += item.getCost();
        }
        return total;
    }
    
    public void empty(){
        this.map.clear();
    }
    
    public void remove(int id){
        this.map.remove(id);
    }
    
    public void update(int id, int quantity){
        Item item = this.map.get(id);
        if (item != null && quantity > 0) {
            item.setQuantity(quantity);
        } else if (item != null && quantity <= 0) {
            // Nếu quantity <= 0, xóa item khỏi giỏ hàng
            remove(id);
        }
    }
    
    public int getItemCount() {
        return this.map.size();
    }
}