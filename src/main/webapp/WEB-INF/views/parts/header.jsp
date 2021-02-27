<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id='menu'>
    <input type='checkbox' id='responsive-menu' onclick='updatemenu()'><label></label>
    <ul>
        <li><a href='http://'>Home</a></li>
        <li><a class='dropdown-arrow' href='http://'>Products</a>
            <ul class='sub-menus'>
                <li><a href='http://'>Products Sub Menu 1</a></li>
                <li><a href='http://'>Products Sub Menu 2</a></li>
                <li><a href='http://'>Products Sub Menu 3</a></li>
                <li><a href='http://'>Products Sub Menu 4</a></li>
            </ul>
        </li>
        <li><a href='http://'>About</a></li>
        <li><a class='dropdown-arrow' href='http://'>Services</a>
            <ul class='sub-menus'>
                <li><a href='http://'>Services Sub Menu 1</a></li>
                <li><a href='http://'>Services Sub Menu 2</a></li>
                <li><a href='http://'>Services Sub Menu 3</a></li>
            </ul>
        </li>
        <li><a href='http://'>Contact Us</a></li>
    </ul>
</nav>

