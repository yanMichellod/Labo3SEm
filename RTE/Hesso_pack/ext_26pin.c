
#include "stm32f7xx_hal.h"
#include "ext_buttons.h"

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
int32_t Ext_Debug_Init (void) {
  GPIO_InitTypeDef GPIO_InitStruct;

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOF_CLK_ENABLE();

  /* Configure GPIO pin: PF9 (GPIO_DEBUG) */
  GPIO_InitStruct.Pin  = GPIO_PIN_9;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOF, &GPIO_InitStruct);

  return 0;
}


