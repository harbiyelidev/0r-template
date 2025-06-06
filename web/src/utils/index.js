/* eslint-disable */

export async function FetchNUI(action, payload) {
  const options = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(payload),
  };

  const url = `https://0r-template/${action}`;

  try {
    const response = await fetch(url, options);

    return await response.json();
  } catch (e) {
    // console.error(`Failed to fetch NUI: ${e.message} (${action})`)

    return false;
  }
}
