var inventory;

(function() {
  inventory = {
    lastId: 0,
    collection: [],
    setDate: function() {
      var now = new Date;
      $('#order_date').text(now.toUTCString());
    },
    cacheTemplate: function() {
      var $i_tmpl = $('#inventory_item').remove();
      this.template = $i_tmpl.html();
    },
    generateNewItem: function() {
      this.lastId++;

      var item = {
        id: this.lastId,
        name: '',
        stockNumber: '',
        quantity: 1,
      };
      
      return item;
    },
    addNewItem: function(e) {
      e.preventDefault();

      // Add new item to inventory object collection property
      var newItem = this.generateNewItem();
      this.collection.push(newItem);

      // Replace template ID with newItem id
      var $tableRow = $(this.template.replace(/ID/g, newItem.id));
      // Add new item to DOM
      $('#inventory').append($tableRow);
    },
    remove: function(id) {
      this.collection = this.collection.filter(function(item) {
        return item.id !== id; 
      });
    },
    findParent: function(e) {
      return $(e.target).closest('tr');
    },
    findId: function($item) {
      return parseInt($item.find('input[type=hidden]').val(), 10);
    },
    deleteItem: function(e) {
      e.preventDefault();

      // this refers to #inventory/table because callback binded to it
      var $item = this.findParent(e).remove();
      var itemId = findId($item); 

      this.remove(itemId);
    },
    update: function($item) {
      var itemId = this.findId($item);
      var item = this.collection.find(function(item) {
        return item.id === itemId;
      });

      item.name = $item.find('[name^=item_name]').val();
      item.stockNumber = $item.find('[name^=item_stock]').val();
      item.quantity = $item.find('[name^=item_quantity]').val();
    },
    updateItem: function(e) {
      var $item = this.findParent(e); 

      this.update($item);
    },
    bindEvents: function() {
      // Need to bind context in newItem methods to inventory object
      $('#add_item').click(this.addNewItem.bind(this)); 
      $('#inventory').on('click', 'a.delete', this.deleteItem.bind(this));
      $('#inventory').on('blur', ':input', this.updateItem.bind(this)); 
    },
    init: function() {
      this.setDate();
      this.cacheTemplate();
      this.bindEvents();
    }
  };

})();

$(inventory.init.bind(inventory));
