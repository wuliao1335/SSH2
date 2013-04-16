package com.test.util;

import java.util.ArrayList;

public class PageList<E> extends ArrayList<E> {
  private int rows = 0;
  public int getRows() {
    return rows;
  }
  public void setRows(int rows) {
    this.rows = rows;
  }
  public PageList(int rows){
    super();
    this.rows = rows;
  }
}
