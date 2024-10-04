using System;
using System.Security.Cryptography;
using System.Text;

public static class PasswordHelper
{
    private const int SaltSize = 16; // 128 bit
    private const int HashSize = 20; // 160 bit
    private const int Iterations = 10000; // Number of iterations

    // Method to hash the password
    public static string HashPassword(string password)
    {
        // Generate a salt
        byte[] salt;
        new RNGCryptoServiceProvider().GetBytes(salt = new byte[SaltSize]);

        // Generate the hash
        var pbkdf2 = new Rfc2898DeriveBytes(password, salt, Iterations);
        var hash = pbkdf2.GetBytes(HashSize);

        // Combine salt and hash
        var hashBytes = new byte[SaltSize + HashSize];
        Array.Copy(salt, 0, hashBytes, 0, SaltSize);
        Array.Copy(hash, 0, hashBytes, SaltSize, HashSize);

        // Convert to base64 for storage
        var base64Hash = Convert.ToBase64String(hashBytes);

        // Format hash with extra information
        return string.Format("$HASH$V1${0}${1}", Iterations, base64Hash);
    }

    // Method to verify the password against a hash
    public static bool VerifyPassword(string password, string hashedPassword)
    {
        // Check if the hash is in the correct format
        if (!hashedPassword.Contains("$HASH$V1$"))
        {
            throw new FormatException("Unexpected hash format.");
        }

        // Extract iterations and base64 string
        var splittedHashString = hashedPassword.Replace("$HASH$V1$", "").Split('$');
        var iterations = int.Parse(splittedHashString[0]);
        var base64Hash = splittedHashString[1];

        // Get the bytes of the hash
        var hashBytes = Convert.FromBase64String(base64Hash);

        // Extract the salt
        var salt = new byte[SaltSize];
        Array.Copy(hashBytes, 0, salt, 0, SaltSize);

        // Hash the given password with the extracted salt
        var pbkdf2 = new Rfc2898DeriveBytes(password, salt, iterations);
        var hash = pbkdf2.GetBytes(HashSize);

        // Compare the results
        for (var i = 0; i < HashSize; i++)
        {
            if (hashBytes[i + SaltSize] != hash[i])
            {
                return false;
            }
        }
        return true;
    }
}
