#include <stdint.h>

#define FP_RESET_DEFAULT                0x30
#define FP_CAPTURE                      0x31
#define FP_GET_IMAGE                    0x32
#define FP_END_IMG_TRANSFER             0x34
#define FP_TEST                         0x3E
#define FP_READY                        0x3F
#define FP_DUMMY                        0x41


/**
 * @brief fingerpint_is_ready
 * Sends a FP_TEST command, and waits for FP_READY answer, if the Fingerpint click does not issue FP_READY, MCU will hang
 *
 */
void fingerprint_is_ready();
/**
 * @brief fingerpint_is_ready
 * Sends a FP_CAPTURE command, the click should then capture the fingerprint image and send a success response
 * the MCU will wait for the response, if the click does not send the response, the MCU will hang
 */
void fingerprint_capture_image();
/**
 * @brief fingerpint_is_ready
 * Sends a FP_GET_IMAGE command, the click will then send bytes from the internal image buffer to the MCU
 * if more than 320*240 dummy bytes are sent, the click will start sending bytes from the beggining of the buffer (image) again
 */
void fingerprint_display_image();
/**
 * @brief fingerpint_is_ready
 * Sends a FP_RESET_DEFAULT command, the click should then capture the fingerprint image and send a FP_DUMMY
 * the MCU will wait for the response, if the click does not send the response, the MCU will hang
 */
void fingerprint_reset_default();
/**
 * @brief fingerpint_is_ready
 * Sends a FP_END_IMG_TRANSFER command, the click should then end the image transfer and send FP_DUMMY bytes as a response
 * the MCU will wait for the response, if the click does not send the response, the MCU will hang
 */
void fingerprint_end_image_transfer();