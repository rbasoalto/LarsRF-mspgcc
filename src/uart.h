#ifndef __UART_H__
#define __UART_H__

void uart_putc(unsigned char c);
void uartInit(void);
void uart_puts(unsigned char *tx_message);

#endif