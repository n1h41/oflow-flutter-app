import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QR Code MAC Address Extraction Tests', () {
    test('should extract MAC address from direct format', () {
      // Test direct MAC address (12 hex characters)
      String qrData = 'A0B1C2D3E4F5';
      String result = _extractMacAddressFromQRData(qrData);
      expect(result, equals('A0B1C2D3E4F5'));
    });

    test('should extract MAC address from colon-separated format', () {
      // Test MAC address with colons
      String qrData = 'Device MAC: A0:B1:C2:D3:E4:F5';
      String result = _extractMacAddressFromQRData(qrData);
      expect(result, equals('A0B1C2D3E4F5'));
    });

    test('should extract MAC address from hyphen-separated format', () {
      // Test MAC address with hyphens
      String qrData = 'MAC=A0-B1-C2-D3-E4-F5';
      String result = _extractMacAddressFromQRData(qrData);
      expect(result, equals('A0B1C2D3E4F5'));
    });

    test('should extract MAC address from JSON format', () {
      // Test JSON format
      String qrData =
          '{"deviceId": "DEVICE123", "mac": "A0:B1:C2:D3:E4:F5", "name": "Pump 1"}';
      String result = _extractMacAddressFromQRData(qrData);
      expect(result, equals('A0B1C2D3E4F5'));
    });

    test('should return empty string for invalid QR data', () {
      // Test invalid data
      String qrData = 'Invalid QR Code Data';
      String result = _extractMacAddressFromQRData(qrData);
      expect(result, equals(''));
    });

    test('should handle mixed case MAC addresses', () {
      // Test mixed case
      String qrData = 'a0b1c2d3e4f5';
      String result = _extractMacAddressFromQRData(qrData);
      expect(result, equals('A0B1C2D3E4F5'));
    });
  });
}

// Copy of the private method for testing
String _extractMacAddressFromQRData(String qrData) {
  // Try different patterns to extract MAC address from QR data

  // Pattern 1: Direct MAC address (12 hex characters)
  RegExp directMacRegex = RegExp(r'[A-Fa-f0-9]{12}');
  Match? directMatch = directMacRegex.firstMatch(qrData);
  if (directMatch != null) {
    return directMatch.group(0)!.toUpperCase();
  }

  // Pattern 2: MAC address with colons or hyphens (AA:BB:CC:DD:EE:FF or AA-BB-CC-DD-EE-FF)
  RegExp colonMacRegex = RegExp(r'([A-Fa-f0-9]{2}[:-]){5}[A-Fa-f0-9]{2}');
  Match? colonMatch = colonMacRegex.firstMatch(qrData);
  if (colonMatch != null) {
    return colonMatch.group(0)!.replaceAll(RegExp(r'[:-]'), '').toUpperCase();
  }

  // Pattern 3: Try to parse as JSON and look for mac, macAddress, or deviceId fields
  try {
    if (qrData.startsWith('{') && qrData.endsWith('}')) {
      // Simple JSON-like parsing for common fields
      final jsonPatterns = [
        RegExp(r'"mac"\s*:\s*"([A-Fa-f0-9:-]{12,17})"'),
        RegExp(r'"macAddress"\s*:\s*"([A-Fa-f0-9:-]{12,17})"'),
        RegExp(r'"deviceId"\s*:\s*"([A-Fa-f0-9:-]{12,17})"'),
        RegExp(r'"device_mac"\s*:\s*"([A-Fa-f0-9:-]{12,17})"'),
      ];

      for (RegExp pattern in jsonPatterns) {
        Match? match = pattern.firstMatch(qrData);
        if (match != null) {
          String mac = match.group(1)!.replaceAll(RegExp(r'[:-]'), '');
          if (mac.length == 12) {
            return mac.toUpperCase();
          }
        }
      }
    }
  } catch (e) {
    // If JSON parsing fails, continue with other methods
  }

  return '';
}
