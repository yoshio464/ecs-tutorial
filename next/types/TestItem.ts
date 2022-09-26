export interface TestItemResponse {
  id: number | null;
  text: string | null;
  updated_at: any;
  created_at: any;
}

export type TestItem = Pick<
  TestItemResponse,
  "text" | "updated_at" | "created_at" | "id"
>;
