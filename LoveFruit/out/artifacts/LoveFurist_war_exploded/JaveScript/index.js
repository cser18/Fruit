$(function () {
    /**
     * 分类项的二级菜单
     * @type {string}
     */
    // var $List = document.getElementsByClassName("tag");
    // for(var $i = 0; $i < $List.length; $i++){
    //     $List[$i].onmouseover = function () {
    //         this.className = "topmenu lihover";
    //     };
    //     $List[$i].onmouseout = function () {
    //         this.className = null;
    //     }
    // }
    /**
     * 关于分类的ajax请求
     */
    var $url = "/LoveFurist/CategoryServlet";
    var $obj = {"method":"findCate"};

    $.post($url, $obj, function (data) {
        $.each(data, function (i,obj) {
        // <li class="tag"><a href="/LoveFurist/ProductServlet?method=findProductByCidWithPage&num=1&cid=1">热门水果</a></li>
            var li = "<li class='tag'><a href='/LoveFurist/ProductServlet?method=findProductByCidWithPage&num=1&cid='"+obj.cid+">"+obj.cname+"</a></li>";
            $("#top").append(li);
        });
    },"json");



    /**
     * ajax请求数据
     * @type {string}
     */
    $url = "/LoveFurist/ProductServlet";
    $obj = {"method":"FindProduct"};

    $.post($url, $obj, function (data){
        // 传下来的热门商品信息
        $.each(data, function (i,obj) {
            var li = "<li><h4><a href='/LoveFurist/ProductServlet?method=detailbyId&pid="+obj.pid+"'>"+obj.pname+"</a></h4> <a href='/LoveFurist/ProductServlet?method=detailbyId&pid="+obj.pid+"'> <img src='"+obj.pimage+"'></a> <div class='prize'>¥"+obj.shop_price+"元</div></li>";
            $("#list").append(li);
        })
        },"json"
    )
});

