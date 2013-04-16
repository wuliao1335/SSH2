package com.test.exception;

/**
 * 模型运行异常
 * 该异常应该被Action处理掉，而不应该在其他层处理，但可以由其他层抛出
 *
 */
public class ModelException extends Exception {
  private int error;//错误代码
  public int getError() {
    return error;
  }
  public ModelException(int error,String message) {
    super(message);
    this.error = error;
  }
}

