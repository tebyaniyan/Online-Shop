using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Microsoft.VisualBasic;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace OnlineShopping
{
    [Serializable]
    public class CartItem
    {
        private int _pid;
        private string _Name;
        private string _picUrl;
        private int _quantity;
        private int _price;
        private int _lineTotal;

        public int pid
        {
            get
            {
                return _pid;
            }
            set
            {
                _pid = value;
            }
        }

        public string Name
        {
            get
            {
                return _Name;
            }
            set
            {
                _Name = value;
            }
        }
        //****************
        public string picUrl
        {
            get
            {
                return _picUrl;
            }
            set
            {
                _picUrl = value;
            }
        }
        //*************************
        public int quantity
        {
            get
            {
                return _quantity;
            }
            set
            {
                _quantity = value;
            }
        }
        //****************
        public int price
        {
            get
            {
                return _price;
            }
            set
            {
                _price = value;
            }
        }
        //***************
        public int lineTotal
        {
            get
            {
                return _quantity * _price;
            }
        }
    }
    //**********************************
    [Serializable]
    public class shoppingCart
    {
        private DateTime _dateCreated;
        private DateTime _lastUpdate;
        private List<CartItem> _items;
        public shoppingCart()
        {
            if (this._items == null)
            {
                this._items = new List<CartItem>();
                this._dateCreated = System.DateTime.Now;
            }
        }
        public List<CartItem> items
        {
            get
            {
                return _items;
            }
            set
            {
                _items = value;
            }
        }
        public void insert(int pid, string Name, int price, int quantity, string picUrl)
        {
            int itemindex = ItemIndexOfID(pid);
            if (itemindex == -1)
            {
                CartItem newitem = new CartItem();
                newitem.pid = pid;
                newitem.Name = Name;
                newitem.quantity = quantity;
                newitem.price = price;
                
                newitem.picUrl = picUrl;
                _items.Add(newitem);
            }
            else
                _items[itemindex].quantity += 1;
            _lastUpdate = DateTime.Now;
        }
        public void update(int RowID, string name, int quantity, int price)
        {
            CartItem item = _items[RowID];
            item.Name = name;
            item.quantity = quantity;
            item.price = price;
            _lastUpdate = DateTime.Now;
        }
        public void deleteitem(int RowID)
        {
            _items.RemoveAt(RowID);
            _lastUpdate = DateTime.Now;
        }
        private int ItemIndexOfID(int pid)
        {
            int index = 0;
            foreach (CartItem item in _items)
            {
                if (item.pid == pid)
                    return index;
                index++;
            }
            return -1;
        }

        public int Total
        {
            get
            {
                int t = 0;
                if (_items == null)
                    return 0;
                foreach (CartItem item in _items)
                    t += item.lineTotal;
                return t;
            }
        }
    }

}